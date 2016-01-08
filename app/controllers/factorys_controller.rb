require 'wice_grid'
require 'base64'
class FactorysController < ApplicationController
	
	def show
    if(session[:user_id])
      if(params[:search])
        @s=params[:search]
        @factory=initialize_grid(Factory,conditions:["FPKID = ? OR Factory_Name = ? OR City = ?",@s,@s,@s],:per_page => 10)
      else
        @factory = initialize_grid(Factory,:per_page=>10)
         @factory1= Factory.where(:FPKID => params[:query])
         end
      else
        render 'sessions/login'
    end
  end

  def view
    if(session[:user_id])
       var = request.query_parameters
      @data = var['FPKID']
     # @Factory_ID=params[:Factory_ID]
      @data3 = var['Ownership_Org_ID']
      @data4=Factory.select('Ownership_Org_ID').where("FPKID = ?",@data)
    

      @fid=var['Factory_ID']
     #@f_name1=Factory.where("Factory_ID = ?",@fid)
      @fname=var['Factory_Name']
      #sql="select * from Factory where FPKID=@data"
      #records_array = ActiveRecord::Base.connection.execute(sql)
      @viewfpkid =Factory.where("FPKID = ? ", @data )
      @vieworg= Organization.where("OrganizationID= ? ", @data3)
      @org1 =Org_relationship.where("Org_ID1 = ? ", @data3)
      @phone1 =Phone.where("Factory_ID = ? ", @fid )
      @mfg1 =Mfg_capacity.where("Factory_ID = ? ", @fid )

     
      #@test=@data4.to_sql
      #@test1=@viewfpkid.to_sql
      # @fname1=@f_name1.to_sql
      # @vieworg= Organization.where("OrganizationID= ? ", @fname1)
    else
       render 'sessions/login'
    end
  end

  def external_view
     if(session[:user_id])
       var = request.query_parameters
      @data1 = var['Factory_ID']
       @view_extern =Externalid.where("Factory_ID = ? ", @data1 )
       @factory_name =Factory.where("Factory_ID = ? ", @data1 )
    else
       render 'sessions/login'
    end
    end

  def org
     if(session[:user_id])
      var = request.query_parameters
      @data2 = var['Organization_Name']
      @org =Organization.where("Organization_Name = ? ", @data2 )
   @test1=@org.to_sql
     else
      render 'session/login'
     end
      end

  def org_rel
     if(session[:user_id])
      var = request.query_parameters
      @data3 = var['OrganizationID']
      @org1 =Org_relationship.where("Org_ID1 = ? ", @data3 )
     else
      render 'session/login'
     end    
    end

  def phone
     if(session[:user_id])
      var = request.query_parameters
      @phone = var['Factory_ID']
      @phone1 =Phone.where("Factory_ID = ? ", @phone )
     else
      render 'session/login'
     end    
    end

  def mfg_capacity
     if(session[:user_id])
      var = request.query_parameters
      @mfg = var['Factory_ID']
      @mfg1 =Mfg_capacity.where("Factory_ID = ? ", @mfg )
     else
      render 'session/login'
     end    
    end

  def email
    if(session[:user_id])
      var = request.query_parameters
       @fid= var['FPKID']
       @date1=Factory.where("FPKID = ? ", @fid).update_all(:Request_sent => Time.now)
     #UserMailer.sent_mail(:user_id).deliver.now
    else
      render 'session/login'
    end
  end
end


