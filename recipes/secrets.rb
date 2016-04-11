# >---------------------------------[ Secrets ]---------------------------------<

inject_into_file "config/secrets.yml", before: "production:\n" do
  "staging:\n"
  "  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>\n"
end
