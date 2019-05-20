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
        let(:params) {{:name => "Autorental America"}}
        let(:carrental) {double('carrental', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:carrental) {instance_double('carrental',:name => 'Autorental America')}
        let(:carrental2) {instance_double('carrental2',:name => 'Kayak')}
        let(:carrentals) {[carrental,carrental2]}
        context "When a carrental is created" do
            describe "When trying to create a carrental with the same name" do
                it "calls the new method to create the carrental" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Carrental).to receive(:new).with(params).and_return(carrental)
                    allow(carrental).to receive(:save)
                    post :create, {carrental: params }
                end
            end
        end
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "carrental"}}
        let(:carrental) {double('carrental', params)}
        let(:id) {'1'}
        
        context "When a carrental is updated" do
            describe "When looking to update a carrental" do
                it "calls the find method to update the carrental" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Carrental).to receive(:find).with(id).and_return(carrental)
                    allow(carrental).to receive(:update_attributes).with(params)
                    get :update,  id: id, carrental: params
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
