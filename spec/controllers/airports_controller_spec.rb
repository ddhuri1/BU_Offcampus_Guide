require 'rails_helper'

RSpec.describe AirportsController, type: :controller do
    describe "#show" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        context "When airport exists" do
            describe "When looking to show a airport" do
                it "calls the find method to retrieve the airport" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Airport).to receive(:find).with(id).and_return(airport)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        
        context "When airport exists" do
            describe "When looking to show all airports" do
                it "calls the all method to retrieve all airports" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Airport).to receive(:all).and_return(airports)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "Greater Binghamton Airport"}}
        let(:airport) {double('airport', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        context "When a airport is created" do
            describe "When looking to create a airport" do
                it "calls the new method to create the airport" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Airport).to receive(:new).with(params).and_return(airport)
                    allow(airport).to receive(:save)
                    post :create, {airport: params }
                end
            end
        end
            
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "Greater Binghamton Airport"}}
        let(:airport) {double('airport', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        context "When a airport is updated" do
            describe "When looking to update a airport" do
                it "calls the find method to update the airport" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Airport).to receive(:find).with(id).and_return(airport)
                    allow(airport).to receive(:update_attributes).with(params)
                    get :update,  id: id, airport: params
                end
            end
        end
    end
    
    describe "#edit" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        context "When airport exists" do
            describe "When looking to edit a airport" do
                it "calls the find method to retrieve the airport" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Airport).to receive(:find).with(id).and_return(airport)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a airport' do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:airport2) {instance_double('airport2',:name => 'Tri-Cities Airport')}
        let(:airports) {[airport,airport2]}
        it 'calls the find method to retreive the airport' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Airport).to receive(:find).with(id).and_return(airport)
            allow(airport).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Airport).to receive(:find).with(id).and_return(airport)
            expect(airport).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Airport deleted!")
        end
        
    #     it 'sets a flash message' do
    #         allow(controller).to receive(:can_proceed).and_return(@current_user)
    #         allow(Airport).to receive(:find).with(id).and_return(airport)
    #         allow(airport).to receive(:destroy)
    #       delete :destroy,  {:id => id}
    #         expect(flash[:notice]).to match(/^Airport deleted!$/)
    #   end
     
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Airport).to receive(:find).with(id).and_return(airport)
            allow(airport).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(airports_path)
        end
    end  
end
