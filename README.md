# Project Whale Backend API

# Development Stack
* Ruby 2.4.1
* Ruby on Rails 5.2
* MySQL 5.7


# API Spec
```
# check API
rake routes 
```

## Offer API

Retrieve offers from backend server
* index
/api/v1/offers
Query strings
```
# offet
sql offset
# limit
sql limit
# list_id
list id only
```
* show
/api/v1/offers/:id

* get_params
/api/v1/offers/get_params
Get options of the offers' column
Query string
```
# param_name

### List of options
#  post_title        :string(255)
#  satisfaction      :string(255)
#  annual_refresh    :integer
#  area              :string(255)
#  degree            :string(255)
#  equity            :string(255)
#  equity_schedule   :string(255)
#  experience        :string(255)
#  experience_level  :string(255)
#  greencard         :string(255)
#  group             :string(255)
#  job_function      :string(255)
#  job_type          :string(255)
#  level             :integer
#  title             :string(255)
#  interest_point    :string(255)
#  other_offer       :string(255)
#  position_type     :string(255)
#  post_time         :datetime
#  promotion_package :string(255)
#  season            :string(255)
#  spider_time       :datetime
#  url               :text(65535)
#  year              :integer
#  base_salary       :integer
#  relocation_fee    :integer
#  sign_bonus        :integer
#  yearly_bonus      :string(255)
#  apply_source      :string(255)
```

## Authentication System
# Get token
```
http://localhost:3000/oauth/token
```

# Authentcate with restricted sources
```
http://localhost:3000/api/v1/offers/1?access_token=<token>
```