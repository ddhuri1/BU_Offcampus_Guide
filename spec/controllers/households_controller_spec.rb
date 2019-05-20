require 'rails_helper'

RSpec.describe HouseholdsController, type: :controller do
    describe "#show" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:household) {instance_double('household',name: 'Sams Club')}
        let(:household2) {instance_double('household2', name: 'Walmart')}
        let(:households) {[household,household2]}
        context "When household exists" do
            describe "When looking to show a household" do
                it "calls the find method to retrieve the household" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Household).to receive(:find).with(id).and_return(household)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:household) {instance_double('household',:name => 'Sams Club')}
        let(:household2) {instance_double('household2',:name => 'Walmart')}
        let(:households) {[household,household2]}
        
        context "When household exists" do
            describe "When looking to show all household" do
                it "calls the all method to retrieve all household" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Household).to receive(:all).and_return(households)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:params) {{:name => "Sams Club"}}
        let(:household) {double('household', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:household) {instance_double('household',:name => 'Sams Club')}
        let(:household2) {instance_double('household2',:name => 'Walmart')}
        let(:households) {[household,household2]}
        context "When a household is created" do
            describe "When trying to create a household with the same name" do
                it "calls the new method to create the household" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Household).to receive(:new).with(params).and_return(household)
                    allow(household).to receive(:save)
                    post :create, {household: params }
                end
            end
            describe "When trying to create a household without filling all the fields" do
                it "flashes a warning saying that was an invalid household" do
                  # expect(Household).to receive(:find).with(@id).and_return(household)
                  # get :show, {:id => id}
                  
                  #expect(flash[:warning]).to eq("Invalid household Entry.")
                end
            end
        end
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "household"}}
        let(:household) {double('household', params)}
        let(:id) {'1'}
        
        context "When a household is updated" do
            describe "When looking to update a household" do
                it "calls the find method to update the household" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Household).to receive(:find).with(id).and_return(household)
                    allow(household).to receive(:update_attributes).with(params)
                    get :update,  id: id, household: params
                end
            end
        end
    end
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:household) {instance_double('household',:name => 'Sams Club')}
        let(:household2) {instance_double('household2',:name => 'Walmart')}
        let(:households) {[household,household2]}
        context "When household exists" do
            describe "When looking to edit a household" do
                it "calls the find method to retrieve the household" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Household).to receive(:find).with(id).and_return(household)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a household' do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:household) {instance_double('household',:name => 'Sams Club')}
        let(:household2) {instance_double('household2',:name => 'Walmart')}
        let(:households) {[household,household2]}
        it 'calls the find method to retreive the household' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Household).to receive(:find).with(id).and_return(household)
            allow(household).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        
        
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Household).to receive(:find).with(id).and_return(household)
            allow(household).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Store deleted!")
        end
     
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Household).to receive(:find).with(id).and_return(household)
            allow(household).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(households_path)
        end
    end
end
