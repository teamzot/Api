namespace :import do
    task :csv1 => :environment do
        filename = "source/DataCleanNov28.csv"
        data = SmarterCSV.process(filename)
        data.each do |row|
            annual_refresh = row[:annualrefresh]
            area = row[:area]
            base_salary = row[:basesalary]

            company_alt_name = row[:companyaltname]
            company_name = row[:companyname]

            degree = row[:degree]
            equity = row[:equity]
            equity_schedule = row[:equityschedule]
            experience = row[:experience]
            experience_level = row[:experiencelevel]
            greencard = row[:greencard]

            group = row[:group]
            interest_point = row[:interestpoint]
            job_function = row[:jobfunction]
            job_type = row[:jobtype]
            level = row[:level]

            other_offer = row[:otherlevel]
            position_type = row[:positiontype]
            post_time = row[:posttime].to_i
            post_title = row[:posttitle]
            post_user = row[:postuser]

            promotion_pkg = row[:promotionpkg]
            relocation_fee = row[:relocationfee]
            satisfaction = row[:satisfaction]
            season = row[:season]
            seasonstring = row[:seasonstring]
            sign_bonus = "0" if row[:signbonus] == ""

            apply_source = row[:source]
            spider_time = row[:spidertime]
            title = row[:title]
            url = row[:url]
            year = row[:year]
            yearly_bonus = "0" if row[:yearlybonus] == ""
            
            # process data
            begin
                base_salary = base_salary.to_i
            rescue ArgumentError
                base_salary = 0
            end
    
            company_name = company_name != "-" ? company_name : company_alt_name
            company_name = "-" if company_name == "-" || company_name == "" || !company_name 
            
            level = level.to_i

            # remove month
            if season
                season = season[0..-2]
            end

            if post_time
                begin
                    post_time = Time.at(post_time)
                rescue ArgumentError
                    post_time = nil
                end
            end

            if year
                year = year.to_i
            end

            # relationship
            company = Company.find_or_create_by(name: company_name)
            post_user = SrcUser.find_or_create_by(name: post_user, source_id: 1)

            post_user.offers.create(
                # relationship
                company_id: company.id,
                source_id: 1,
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
                seasonstring: seasonstring,
                sign_bonus_string: sign_bonus,
                year: year,
                yearly_bonus: yearly_bonus, 
                apply_source: apply_source,
                url: url
            )
        end
    end 
end