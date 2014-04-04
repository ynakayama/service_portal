# -*- encoding: utf-8 -*-

class DemandsController < ApplicationController
  def new
    @demand = Demand.new
    @machines = Machine.all
    @supports = Support.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @demand }
    end
  end

  def create
    @demand = Demand.new(params[:demand])

    @vm = Vm.new(params[:vms])
    @demand.vms << @vm
    @svn = Svn.new(params[:svns])
    @demand.svns << @svn
    @book = Book.new(params[:books])
    @demand.books << @book
    @enquiry = Enquiry.new(params[:enquiries])
    @demand.enquiries << @enquiry
    @machines = Machine.all
    @supports = Support.all

    @demand.processed = false
    @demand.user_id = 1

    respond_to do |format|
      if @demand.save
        Notifier.accept_demands(@demand).deliver if Rails.env.production?
        Notifier.notify_user(@demand).deliver if Rails.env.production?
        format.html { redirect_to root_path,
          notice: 'ご利用ありがとうございました！後ほどイノベーション推進部よりご連絡いたします' }
        format.json { render json: @demand, status: :created, location: @demand }
      else
        format.html { render action: "new" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end
end
