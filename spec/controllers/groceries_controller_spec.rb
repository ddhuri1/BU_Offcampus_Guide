require 'rails_helper'

describe GroceriesController, type: :controller do
    describe "#show" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:grocery) {instance_double('grocery',name: 'Walmart')}
        let(:grocery2) {instance_double('grocery2',name: 'Price Chopper')}
        let(:groceries) {[grocery,grocery2]}
        context "When grocery exists" do
            describe "When looking to show a grocery" do
                it "calls the find method to retrieve the grocery" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Grocery).to receive(:find).with(id).and_return(grocery)
                    
                    get :show,  :id => id
                   # allow(response).to redirect_to(groceries_path)

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
        let(:grocery) {instance_double('grocery', name: 'Walmart')}
        let(:grocery2) {instance_double('grocery2', name: 'Price Chopper')}
        let(:groceries) {[grocery,grocery2]}
        
        context "When Grocery exists" do
            describe "When looking to show all Grocery" do
                it "calls the all method to retrieve all Grocery" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Grocery).to receive(:all).and_return(groceries)
                    get :index, :id => id
                    #allow(response).to redirect_to(groceries_path)
                end
            end
        end
    end
    
    describe "#create" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "Walmart"}}
        let(:grocery) {double('grocery', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:grocery) {instance_double('grocery',:name => 'Walmart')}
        let(:grocery2) {instance_double('grocery2',:name => 'Price Chopper')}
        let(:groceries) {[grocery,grocery2]}
        context "When a grocery is created" do
            describe "When trying to create a grocery with the same name" do
                 it "calls the new method to create the grocery" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Grocery).to receive(:new).with(params).and_return(grocery)
                    allow(grocery).to receive(:save)
                    post :create, {grocery: params }
                end
            end
            
        end
    end
    
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "grocery"}}
        let(:grocery) {double('grocery', params)}
        let(:id) {'1'}
        
        context "When a grocery is updated" do
            describe "When looking to update a grocery" do
                it "calls the find method to update the grocery" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Grocery).to receive(:find).with(id).and_return(grocery)
                    allow(grocery).to receive(:update_attributes).with(params)
                    get :update,  id: id, grocery: params
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
        let(:grocery) {instance_double('grocery',:name => 'Walmart')}
        let(:grocery2) {instance_double('grocery2',:name => 'Price Chopper')}
        let(:groceries) {[grocery,grocery2]}
        context "When grocery exists" do
            describe "When looking to edit a grocery" do
                it "calls the find method to retrieve the grocery" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Grocery).to receive(:find).with(id).and_return(grocery)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a grocery' do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:grocery) {instance_double('grocery',name: 'Walmart')}
        it 'calls the find method to retreive the grocery' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            #allow(User).to receive(:find).and_return(:user_id)
            expect(Grocery).to receive(:find).with(id).and_return(grocery)
            allow(grocery).to receive(:destroy)
            delete :destroy, :id => id
        end
        it 'calls the destroy method to delete the grocery' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            #allow(User).to receive(:find).and_return(:user_id)
            expect(Grocery).to receive(:find).with(id).and_return(grocery)
            allow(grocery).to receive(:destroy)
            delete :destroy, :id => id
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Grocery).to receive(:find).with(id).and_return(grocery)
            expect(grocery).to receive(:destroy)
            get :destroy,  :id => id
            expect(flash[:notice]).to eq("Store deleted!")
        end
        
        #it 'sets a flash message' do
        #    allow(User).to receive(:find).and_return(:user_id)
        #    allow(Grocery).to receive(:find).with(id).and_return(grocery)
        #    allow(grocery).to receive(:destroy)
        #    delete :destroy,  {:id => id}
        #    expect(response ).to_not be_nil
        #    #expect(grocery ).to match("Store deleted!")
        #    #flash[:notice].should =~ /Store deleted!/i
        #    #expect(flash[:notice]).to match("Store deleted!")
        #end
      
        it 'redirects to the groceries page' do
            #user = User.new
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Grocery).to receive(:find).with(id).and_return(grocery)
            allow(grocery).to receive(:destroy)
            get :destroy,  {:id => id}
            #expect(response).should redirect_to(user.groceries_path)
            expect(response).to redirect_to(groceries_path)
        end
    end  
end
