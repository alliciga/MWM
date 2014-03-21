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
    f.inputs "账户信息" do
      f.input :email, :label => "账户名称（Email格式）"
      f.input :password, :label => "密码"
      f.input :password_confirmation, :label => "密码确认"
    end
    f.actions do
      f.action :submit, :label => "确认"
      f.action :cancel, :label => "取消"
    end
  end
end
