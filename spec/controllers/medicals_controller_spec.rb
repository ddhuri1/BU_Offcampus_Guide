require 'rails_helper'

RSpec.describe MedicalsController, type: :controller do
    describe "#show" do
        before(:each) do
            controller.class.skip_before_filter :current_user
            
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:medical) {instance_double('medical',:name => 'CVS')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        context "When medical exists" do
            describe "When looking to show a medical" do
                it "calls the find method to retrieve the medical" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Medical).to receive(:find).with(id).and_return(medical)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:medical) {instance_double('medical',:name => 'CVS')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        context "When medical exists" do
            describe "When looking to show all medical" do
                it "calls the all method to retrieve all medical" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Medical).to receive(:all).and_return(medicals)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:params) {{:name => "CVS"}}
        let(:medical) {double('medical', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:medical) {instance_double('medical',:name => 'CVS')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        context "When a medical is created" do
            describe "When trying to create a medical with the same name" do
                it "calls the new method to create the medical" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Medical).to receive(:new).with(params).and_return(medical)
                    allow(medical).to receive(:save)
                    post :create, {medical: params }
                end
            end
        end
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "CVS"}}
        let(:medical) {double('medical', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        context "When a medical is updated" do
            describe "When looking to update a medical" do
                it "calls the find method to update the medical" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Medical).to receive(:find).with(id).and_return(medical)
                    allow(medical).to receive(:update_attributes).with(params)
                    get :update,  id: id, medical: params
                end
            end
        end
    end
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:medical) {instance_double('medical',:name => 'CVS')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        context "When medical exists" do
            describe "When looking to edit a medical" do
                it "calls the find method to retrieve the medical" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Medical).to receive(:find).with(id).and_return(medical)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a medical' do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:medical) {instance_double('medical',:name => 'CVS')}
        let(:medical2) {instance_double('medical2',:name => 'Walgreens')}
        let(:medicals) {[medical,medical2]}
        it 'calls the find method to retreive the medical' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Medical).to receive(:find).with(id).and_return(medical)
            allow(medical).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Medical).to receive(:find).with(id).and_return(medical)
            expect(medical).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Medical deleted!")
        end
        
        
     
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Medical).to receive(:find).with(id).and_return(medical)
            allow(medical).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(medicals_path)
        end
    end
end
