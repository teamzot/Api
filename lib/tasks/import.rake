namespace :import do
    task :csv1 => :environment do
        filename = 'source/DataClean2.csv'
        file = File.new(filename, 'r')
        line = 0
        file.each_line("\n") do |row|
            line += 1
            next if line == 1
            columns = row.split(",")
            
            # fetch raw
            annual_refresh = columns[0].strip
            area = columns[1].strip
            base_salary = columns[3].strip

            company_alt_name = columns[4].strip
            company_name = columns[5].strip

            degree = columns[6].strip
            equity = columns[7].strip
            equity_schedule = columns[8].strip
            experience = columns[9].strip
            experience_level = columns[10].strip
            greencard = columns[11].strip

            group = columns[12].strip
            interest_point = columns[13].strip
            job_function = columns[14].strip
            job_type = columns[15].strip
            level = columns[16].strip

            other_offer = columns[17].strip
            position_type = columns[18].strip
            post_time = columns[20].strip
            post_title = columns[21].strip
            post_user = columns[22].strip

            promotion_pkg = columns[23].strip
            relocation_fee = columns[24].strip
            satisfaction = columns[25].strip
            season = columns[26].strip
            sign_bonus = columns[27].strip

            apply_source = columns[28].strip
            spider_time = columns[29].strip
            title = columns[30].strip
            url = columns[31].strip
            year = columns[32].strip
            yearly_bonus = columns[33].strip
            
            # process data
            begin
                base_salary = base_salary.to_i
            rescue ArgumentError
                base_salary = 0
            end
    
            company_name = company_name != "-" ? company_name : company_alt_name
            next if company_name == "-" || company_name == ""
            
            level = level.to_i

            # remove month
            season = season[0..-2]

            begin
                post_time = post_time.to_datetime
            rescue ArgumentError
                post_time = nil
            end

            year = year.to_i

            # relationship
            company = Company.find_or_create_by(name: company_name)
            post_user = SrcUser.find_or_create_by(name: post_user, source_id: 1)

            post_user.offers.create(
                # relationship
                company_id: company.id,
                # start columns
                post_title: post_title,
                annual_refresh: annual_refresh,
                area: area,
                base_salary: base_salary,
                degree: degree,
                equity: equity,
                equity_schedule: equity_schedule,
                experience: experience,
                experience_level: experience_level,
                greencard: greencard,

                group: group,
                interest_point: interest_point,
                job_function: job_function,
                job_type: job_type,
                level: level,

                other_offer: other_offer,
                position_type: position_type,
                post_time: post_time,
                promotion_package: promotion_pkg,
                relocation_fee_string: relocation_fee,
                satisfaction: satisfaction,
                season: season,
                sign_bonus_string: sign_bonus,
                year: year,
                yearly_bonus: yearly_bonus, 
                apply_source: apply_source,
                url: url
            )
        end
    end 
end