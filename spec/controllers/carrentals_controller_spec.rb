require 'rails_helper'

RSpec.describe CarrentalsController, type: :controller do
    describe "#show" do
        before(:each) do
            controller.class.skip_before_filter :current_user
            
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        context "When carrental exists" do
            describe "When looking to show a carrental" do
                it "calls the find method to retrieve the carrental" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Carrental).to receive(:find).with(id).and_return(carrental)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        
        context "When carrental exists" do
            describe "When looking to show all carrental" do
                it "calls the all method to retrieve all carrental" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Carrental).to receive(:all).and_return(carrentals)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        context "When a carrental is created" do
            describe "When trying to create a carrental with the same name" do
                it "flashes a warning saying that a carrental with that name already exists" do
                end
            end
            describe "When trying to create a carrental without filling all the fields" do
                it "flashes a warning saying that was an invalid bus" do
                  # expect(Carrental).to receive(:find).with(@id).and_return(carrental)
                  # get :show, {:id => id}
                  
                  #expect(flash[:warning]).to eq("Invalid carrental Entry.")
                end
            end
        end
    end
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        context "When carrental exists" do
            describe "When looking to edit a carrental" do
                it "calls the find method to retrieve the carrental" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Carrental).to receive(:find).with(id).and_return(carrental)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a bus' do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        it 'calls the find method to retreive the bus' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Carrental).to receive(:find).with(id).and_return(carrental)
            allow(carrental).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Carrental).to receive(:find).with(id).and_return(carrental)
            expect(carrental).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Car Rental deleted!")
        end
        
        
     
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Carrental).to receive(:find).with(id).and_return(carrental)
            allow(carrental).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(carrentals_path)
        end
    end
end
