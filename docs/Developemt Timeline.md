module_name | estimeted_time (weeks) | depedency_modules
---|---|----
crop_listing_module|3| crop_module
crop_trade_module|4| crop_listing_module
money_transaction_module|2| crop_trade_module
crop_transfer_module|1| crop_trade_module
address_module|2|
sensor_logging_module|3| field_module
gis_module|4| user_module, address_module
crop_module|4| user_module, address_module
field_module|4| crop_module, address_module
super_crop_module|2| crop_module
super_field_module|2| field_module
faritilizer_module|2| user_module
vendor_module|4| user_module
ai_suggestion_module|8| field_module, crop_module
expart_suggestion_module|4| ai_suggestion_module, field_module, crop_module
admin_module|6|user_module, address_module, auth_module, permsion_module
auth_module|3|permsion_module
user_module|3|address_module, auth_module, permsion_module
permssion_module|3|
