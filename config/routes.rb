Rails.application.routes.draw do



  get("/users", {:controller =>"users", :action=>"listusers"})
  get("/users/:username",{:controller =>"users", :action=>"showuser"})
  post("/add_user",{:controller =>"users", :action=>"showuser"})
  
  get("/photos/:id",{:controller=>"photos",:action=>"showphoto"})

end
