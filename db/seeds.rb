# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# -*- coding: utf-8 -*-

Rails.logger.info "DB Seeds Migration Tool"
Rails.logger.info "-----------------------"
beginning_time = Time.now

Rails.logger.info "Generating data..."
data = DataExample.new.call

Rails.logger.info "Migration information      "
Rails.logger.info "---------------------------"
Rails.logger.info "Total Styles      = #{Style.count}"
Rails.logger.info "Total Categories  = #{Category.count}"
Rails.logger.info "Total Beers       = #{Beer.count}"
Rails.logger.info "Total Variants    = #{Variant.count}"
Rails.logger.info "Total Users       = #{User.count}"
Rails.logger.info "Total Ratings     = #{Rating.count}"
Rails.logger.info "---------------------------"
end_time = Time.now
Rails.logger.info "Time elapsed #{(end_time - beginning_time).round(2)} seconds"
