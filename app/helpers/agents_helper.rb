module AgentsHelper
 def send_sms(agent)
  		accountSID = 'AC399f914ac8260eff456fa5da65da9f5b'
        authToken ='370952cfd2245b1cd8c658dd049d70af'
        client = Twilio::REST::Client.new accountSID, authToken
        from = '+12138175357'
        #@admins.each do |admin|
        friends = {'+201000200697'=> "#{agent.name}"}
        friends.each do |key, value|
           client.account.messages.create(
             :from => from,
             :to => key,
             :body => "#{@agent.name} has signed up, with number #{agent.tel1}") 
          puts "Sent message to #{agent.name} with number #{agent.tel1}"
        end
 end
end
