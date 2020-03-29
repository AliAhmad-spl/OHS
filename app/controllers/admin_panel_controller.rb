# frozen_string_literal: true

# :Admin Panel Controller:
class AdminPanelController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource class: false

  def index
    @users = User.where.not(id: current_user.id)
    add_breadcrumb 'Admin Panel', admin_panel_path,
                   title: 'Back to the Admin Panel'
  end

  def users
    @users = User.where.not(id: current_user.id).order('created_at DESC')
    add_breadcrumb 'Admin Panel', admin_panel_path,
                   title: 'Back to the Admin Panel'
    add_breadcrumb 'All Users', admin_users_path,
                   title: 'Back to the All Users'
  end

  def pending_requests
    @hostels = Hostel.pending.includes(:user)
  end

  def change_status
    if params[:published].present?
      @status = 'Published'
      @hostel = Hostel.find(params[:published])
      @hostel.update(status: 'published')
    else
      @status = 'Rejected'
      @hostel = Hostel.find(params[:rejected])
      @hostel.update(status: 'rejected')      
    end
    redirect_to pending_requests_path, notice: "Hostel #{@hostel.name} has been #{@status}"
  end

  def change_access
    @user = User.find(params[:enable] || params[:disable])
    if params[:enable].present?
      @access = 'Enabled'
      @user.update(revoke_access: false)
    else
      @access = 'Disabled'
      @user.update(revoke_access: true)
    end
    redirect_to admin_users_path, notice: "#{@user.email} has been #{@access}"
  end
end
