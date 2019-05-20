require 'rails_helper'

RSpec.describe BusesController, type: :controller do
    describe "#show" do
        before(:each) do
            controller.class.skip_before_filter :current_user
            
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        context "When bus exists" do
            describe "When looking to show a bus" do
                it "calls the find method to retrieve the bus" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Bus).to receive(:find).with(id).and_return(bus)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        
        context "When bus exists" do
            describe "When looking to show all bus" do
                it "calls the all method to retrieve all bus" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Bus).to receive(:all).and_return(buses)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        let(:params) {{:name => "Mega Bus"}}
        let(:bus) {double('bus', params)}
        context "When a bus is created" do
            describe "When trying to create a bus " do
                
                it "calls the new method to create the bus" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Bus).to receive(:new).with(params).and_return(bus)
                    allow(bus).to receive(:save)
                    post :create, {bus: params }
                end
               
            end
        end
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "bus"}}
        let(:bus) {double('bus', params)}
        let(:id) {'1'}
        
        context "When a bus is updated" do
            describe "When looking to update a bus" do
                it "calls the find method to update the bus" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Bus).to receive(:find).with(id).and_return(bus)
                    allow(bus).to receive(:update_attributes).with(params)
                    get :update,  id: id, bus: params
                end
            end
        end
    end
    
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        context "When bus exists" do
            describe "When looking to edit a bus" do
                it "calls the find method to retrieve the bus" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Bus).to receive(:find).with(id).and_return(bus)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a bus' do
      let(:id) {'1'}
        let(:id2) {'2'}
        let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        it 'calls the find method to retreive the bus' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Bus).to receive(:find).with(id).and_return(bus)
            allow(bus).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Bus).to receive(:find).with(id).and_return(bus)
            expect(bus).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Bus deleted!")
        end
        
        
     
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Bus).to receive(:find).with(id).and_return(bus)
            allow(bus).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(buses_path)
        end
    end
end
