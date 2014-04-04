# -*- coding: utf-8 -*-

class ServicesController < ApplicationController
  before_filter :authenticate_user!

  # GET /services
  # GET /services.json
  def index

    if params[:processed].nil?
      @demands = Demand.scoped(
        :include => [:svns, :vms, :books, :enquiries],
        :order => "created_at DESC").page(params[:page]).per(10)
    else
      @demands = Demand.scoped(
        :include => [:svns, :vms, :books, :enquiries],
        :order => "created_at DESC").where(:processed => false).page(params[:page]).per(15)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demands }
    end
  end

  # GET /services/1/edit
  def edit
    @demand = Demand.find(params[:id])
    @user = User.find_by_id(@demand.user_id)
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @demand = Demand.find(params[:id])
    @demand.user_id = current_user.id
    @user = User.find(@demand.user_id)

    respond_to do |format|
      if @demand.update_attributes(params[:demand])
        Notifier.processed_demands(@demand,@user).deliver if Rails.env.production?
        format.html { redirect_to services_path, notice: '申し込みは正常に処理されました' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end
end
