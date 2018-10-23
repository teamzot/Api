namespace :import do
    task :csv_easy2 => :environment do
        filename = 'source/items_easy_2.csv'
        file = File.new(filename, 'r')
        line = 0
        file.each_line("\n") do |row|
            line += 1
            next if line == 1
            columns = row.split(",")
            
            # fetch raw
            annual_refresh = columns[0].strip
            area = columns[1].strip
            company_alt_name = columns[3].strip
            company_name = columns[4].strip

            degree = columns[5].strip
            equity_schedule = columns[6].strip
            experience = columns[7].strip
            experience_level = columns[8].strip
            greencard = columns[9].strip

            job_function = columns[10].strip
            job_type = columns[11].strip
            level = columns[12].strip

            other_offer = columns[13].strip
            position_type = columns[14].strip
            post_time = columns[15].strip
            post_title = columns[16].strip
            post_user = columns[17].strip

            promotion_pkg = columns[18].strip
            relocation_fee = columns[19].strip
            satisfaction = columns[20].strip
            season = columns[21].strip
            source = columns[22].strip
            url = columns[24].strip
            year = columns[25].strip

            company_name = company_name != "-" ? company_name : company_alt_name
            next if company_name == "-" || company_name == ""

            if greencard == "-"
                greencard = 0
            else
                greencard = 1
            end
            
            level = level.to_i
            
            begin
                post_time = post_time.to_datetime
            rescue ArgumentError
                post_time = nil
            end

            # relocation fee
            relocation_fee = relocation_fee.to_i
            year = year.to_i

            company = Company.find_or_create_by(name: company_name)

            Offer.create(
                company_id: company.id,
                post_title: post_title,
                post_user: post_user,
                annual_refresh: annual_refresh,
                area: area,
                degree: degree,
                equity_schedule: equity_schedule,
                experience: experience,
                experience_level: experience_level,
                greencard: greencard,
                job_function: job_function,
                job_type: job_type,
                level: level,
                position_type: position_type,
                post_time: post_time,
                promotion_package: promotion_pkg,
                relocation_fee: relocation_fee,
                season: season,
                source: source,
                url: url
            )
        end
    end 
end