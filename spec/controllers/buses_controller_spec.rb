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
        let(:bus) {instance_double('bus',:name => 'Mega Bus')}
        let(:bus2) {instance_double('bus2',:name => 'GreyHound')}
        let(:buses) {[bus,bus2]}
        context "When a bus is created" do
            describe "When trying to create a bus with the same name" do
                it "flashes a warning saying that a bus with that name already exists" do
                end
            end
            describe "When trying to create a bus without filling all the fields" do
                it "flashes a warning saying that was an invalid bus" do
                  # expect(Bus).to receive(:find).with(@id).and_return(bus)
                  # get :show, {:id => id}
                  
                  #expect(flash[:warning]).to eq("Invalid bus Entry.")
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
