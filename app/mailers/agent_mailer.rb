class AgentMailer < ApplicationMailer
	def welcome_email(agent)
    @agent = agent
    @url  = 'new-domiat.com'
    #headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'
    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":0,"text/html":"Unsubscribe <%Here%>","text/plain":"Medo"}}}}'
    mail(to: @agent.email, subject: "Welcome #{@agent.name} to #{@url} .")
  end
  def inform_admin(agent)
    @agent = agent
    #@url  = 'new-domiat.com'
    #headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":1,"text/html":"Unsubscribe <%Here%>","text/plain":"Unsubscribe Here: <% %>"}}}}'
    headers['X-SMTPAPI'] = '{"filters":{"subscriptiontrack":{"settings":{"enable":0,"text/html":"Unsubscribe <%Here%>","text/plain":"Medo"}}}}'
    mail(to: 'mamdouh_farh@yahoo.com', subject: "#{@agent.name} has signed up.")
  end
end
