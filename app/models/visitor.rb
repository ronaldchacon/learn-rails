class Visitor
  include ActiveModel::Model
  attr_accessor :email, :string
  validates_presence_of :email
  validates_format_of :email,
    with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  def subscribe
    mailchimp = Gibbon::API.new(ENV["MAILCHIMP_API_KEY"])
    result = mailchimp.lists.subscribe({
      id: ENV["MAILCHIMP_LIST_ID"],
      email: {email: self.email},
      double_optin: false,
      update_existing: false,
      send_welcome: true
    })
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end
end