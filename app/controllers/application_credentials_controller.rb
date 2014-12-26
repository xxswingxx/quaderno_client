class ApplicationCredentialsController < ApplicationController
  # GET /application_credentials
  # GET /application_credentials.json

  SITE = 'http://lvh.me:3000'

  def index
    @application_credentials = ApplicationCredential.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_credentials }
    end
  end

  def get_auth
    credentials = ApplicationCredential.last
    client = OAuth2::Client.new(credentials.client_id, credentials.client_secret, site: SITE)
    token = client.auth_code.get_token(params[:code], redirect_uri: credentials.redirect_uri)
    api_client = ApiClient.new
    api_client.update_attributes(token: token.token, token_expires_at: Time.at(token.expires_at), refresh_token: token.refresh_token)
    redirect_to api_clients_path
  end

  # GET /application_credentials/1
  # GET /application_credentials/1.json
  def show
    @application_credential = ApplicationCredential.find(params[:id])
    client = OAuth2::Client.new(@application_credential.client_id, @application_credential.client_secret, site: SITE)
    @url = client.auth_code.authorize_url(redirect_uri: @application_credential.redirect_uri)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_credential }
    end
  end

  # GET /application_credentials/new
  # GET /application_credentials/new.json
  def new
    @application_credential = ApplicationCredential.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_credential }
    end
  end

  # GET /application_credentials/1/edit
  def edit
    @application_credential = ApplicationCredential.find(params[:id])
  end

  # POST /application_credentials
  # POST /application_credentials.json
  def create
    @application_credential = ApplicationCredential.new(params[:application_credential])

    respond_to do |format|
      if @application_credential.save
        format.html { redirect_to @application_credential, notice: 'Application credential was successfully created.' }
        format.json { render json: @application_credential, status: :created, location: @application_credential }
      else
        format.html { render action: "new" }
        format.json { render json: @application_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_credentials/1
  # PUT /application_credentials/1.json
  def update
    @application_credential = ApplicationCredential.find(params[:id])

    respond_to do |format|
      if @application_credential.update_attributes(params[:application_credential])
        format.html { redirect_to @application_credential, notice: 'Application credential was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_credentials/1
  # DELETE /application_credentials/1.json
  def destroy
    @application_credential = ApplicationCredential.find(params[:id])
    @application_credential.destroy

    respond_to do |format|
      format.html { redirect_to application_credentials_url }
      format.json { head :no_content }
    end
  end
end
