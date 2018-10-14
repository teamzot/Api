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

            if area == "BayArea"
                area = 0
            elsif area == "Greater Seattle Area"
                area = 1
            elsif area == "Greater New York Area"
                area = 2
            elsif area == "Southern California"
                area = 3
            else
                area = 4
            end

            company_name = company_name != "-" ? company_name : company_alt_name
            next if company_name == "-" || company_name == ""

            if degree == "本科"
                degree = 0
            elsif degree == "硕士"
                degree = 1
            elsif degree == "博士"
                degree = 2
            else
                degree = 3
            end

            if experience == "<3个月短暂实习/全职"
                experience = 0
            elsif experience == "1-3年"
                experience = 1
            elsif experience == "3-5年"
                experience = 2
            elsif experience == "5-10年"
                experience = 3
            elsif experience == "11-15年"
                experience = 4
            else
                experience = 4
            end

            if experience_level == "fresh grad应届毕业生"
                experience_level = 0
            elsif experience_level == "在职跳槽"
                experience_level = 1
            else
                experience_level = 2
            end

            if greencard == "-"
                greencard = 0
            else
                greencard = 1
            end
            
            if job_type == "全职"
                job_type = 0
            elsif job_type == "合同工"
                job_type = 1
            elsif job_type == "实习"
                job_type = 2
            else 
                job_type = 3
            end

            level = level.to_i
            
            if position_type == "IC (Individual Contributor 技术岗，不管人)"
                position_type = 0
            elsif position_type == "Manager"
                position_type = 1
            else
                position_type = 2
            end

            begin
                post_time = post_time.to_datetime
            rescue ArgumentError
                post_time = nil
            end

            # relocation fee
            if relocation_fee.to_i != 0
                relocation_fee = relocation_fee.to_i
            else
                str = relocation_fee.downcase
                idx = str.index('k')
                if idx && idx > 0
                    val = str[0..(idx-1)]
                    relocation_fee = 1000* val.to_i    
                else
                    relocation_fee = 0
                end
            end 

            if season == "1-3月"
                season = 0
            elsif season == "4-6月"
                season = 1
            elsif season == "7-9月"
                season = 2
            else
                season = 3
            end

            if source == "猎头"
                source = 0
            elsif source == "内推"
                source = 1
            elsif source == "网上海投"
                source = 2
            elsif source == "实习ReturnOffer"
                source = 3
            else
                source = 4
            end

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