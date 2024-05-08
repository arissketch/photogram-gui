class UsersController <ApplicationController

  def listusers
    all_users=User.all
    @list_of_users=all_users.order({ :created_at => :desc })


    render({ :template => "users/users"})
  end
  def showuser
    the_username = params.fetch("username")
    matching_user=User.where({:username=>the_username})
    @the_user=matching_user.at(0)
    matching_photos=Photo.where({:owner_id => @the_user.id})
    @all_photos=matching_photos.order({:created_at => :desc})
    render({:template=>"users/show"})
  end
  def add
    u = User.new
    u.username = params.fetch("input_username")
    u.save

    redirect_to("/users/#{u.username}")
  end
  def updateuser
    fetch_username=params.fetch("username")
    matching_user=User.where({:username=>fetch_username})
    the_user=matching_user.at(0)

    # Overwrite each column with the values from user inputs
    the_user.username=params.fetch("input_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end


end
