ActiveAdmin.register AdminUser do
  menu :label => "管理员", :parent => "系统管理", :priority => 8
  index do
    column "账户",:email
    column "本次登录时间",:current_sign_in_at
    column "上次登录时间",:last_sign_in_at
    column "登录次数",:sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
