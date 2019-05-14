module MailingList
  extend ActiveSupport::Concern

  def self.subscribe(email, name)
    list_id = ENV["MAILCHIMP_LIST_ID"]

    body = { email_address: email,
             status: 'subscribed',
             merge_fields: {FNAME: user_first_name(name),
                            LNAME: user_last_name(name)}
           }

    @gb = Gibbon::Request.new
    @gb.lists(list_id).members.create(body: body)
  end

  def self.user_first_name(name)
    name.split(' ').first
  end

  def self.user_last_name(name)
    name.split[1..-1].join(' ')
  end
end