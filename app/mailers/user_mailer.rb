class UserMailer < ApplicationMailer
   default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://eventbrite-project.fr' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
  
  def attendance_email(attendance)
    @attendance = attendance
    @user = User.find(@attendance.user_id)
    @event = Event.find(@attendance.event_id)

    @url  = 'http://eventbrite-project.fr'

    mail(to: @user.email, subject: 'Une reservation sur votre évènement à été faite !')
  end
  
end
