require 'rails_helper'

RSpec.describe LocalsController, type: :controller do
    describe "#show" do
        before(:each) do
            controller.class.skip_before_filter :current_user
            
        end
        #let(:current_user) {instance_double(User,:id => '1')}
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When local exists" do
            describe "When looking to show a local" do
                it "calls the find method to retrieve the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:find).with(id).and_return(local)
                    
                    get :show,  {:id => id}

                end
            end
        end
    end
    
    describe "#index" do
       
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        
        context "When local exists" do
            describe "When looking to show all local" do
                it "calls the all method to retrieve all local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:all).and_return(locals)
                    get :index, {:id => id}
                end
            end
        end
    end
    
    describe "#create" do
        let(:params) {{:name => "BC Transit"}}
        let(:local) {double('local', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When a local is created" do
            describe "When trying to create a local with the same name" do
                it "calls the new method to create the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:new).with(params).and_return(local)
                    allow(local).to receive(:save)
                    post :create, {local: params }
                end
            end
        end
    end
    
    describe "#update" do
        before :each do
            @current_user=instance_double('User', name: 'student')
        end
        let(:params) {{:name => "BC Transit"}}
        let(:local) {double('local', params)}
        let(:id) {'1'}
        let(:id2) {'2'}
        #let(:airport) {instance_double('airport',:name => 'Greater Binghamton Airport')}
        let(:local2) {instance_double('local2',:name => 'OCCTt')}
        let(:locals) {[local,local2]}
        context "When a local is updated" do
            describe "When looking to update a local" do
                it "calls the find method to update the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:find).with(id).and_return(local)
                    allow(local).to receive(:update_attributes).with(params)
                    get :update,  id: id, local: params
                end
            end
        end
    end
    
    describe "#edit" do
        let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        context "When local exists" do
            describe "When looking to edit a local" do
                it "calls the find method to retrieve the local" do
                    allow(controller).to receive(:can_proceed).and_return(@current_user)
                    expect(Local).to receive(:find).with(id).and_return(local)
                    get :edit, {:id => id}
                end
            end
        end
    end
  
    describe 'destroys a local' do
      let(:id) {'1'}
        let(:id2) {'2'}
        let(:local) {instance_double('local',:name => 'BC Transit')}
        let(:local2) {instance_double('local2',:name => 'OCCT')}
        let(:locals) {[local,local2]}
        it 'calls the find method to retreive the local' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            expect(Local).to receive(:find).with(id).and_return(local)
            allow(local).to receive(:destroy)
            delete :destroy, {:id => id}
        end
        it 'sets a flash message' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Local).to receive(:find).with(id).and_return(local)
            expect(local).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(flash[:notice]).to eq("Store deleted!")
        end
        
        
        it 'redirects to the groceries page' do
            allow(controller).to receive(:can_proceed).and_return(@current_user)
            allow(Local).to receive(:find).with(id).and_return(local)
            allow(local).to receive(:destroy)
            get :destroy,  {:id => id}
            expect(response).to redirect_to(locals_path)
        end
    end
end
