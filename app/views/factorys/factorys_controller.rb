require 'wice_grid'
class FactorysController < ApplicationController
	
	def show
    if(session[:user_id])
    @factory = initialize_grid(Factory,:per_page=>10)
    @factory1= Factory.where(:FPKID => params[:query])
    else
    render 'sessions/login'
    end
  end

  def view
    if(session[:user_id])
       var = request.query_parameters
      @data = var['FPKID']
      @data3 = var['Ownership_Org_ID']
      
       @viewfpkid =Factory.where("FPKID = ? ", @data )
       @vieworg= Organization.where("OrganizationID= ? ", @data3)
       @test=@vieworg.to_sql
       @test1=@viewfpkid.to_sql
    else
       render 'sessions/login'
    end
  end

  def external_view
     if(session[:user_id])
       var = request.query_parameters
      @data1 = var['Factory_ID']
       @view_extern =Externalid.where("Factory_ID = ? ", @data1 )
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

  end

