def api_get(action, params = {}, version = '1')
  get make_url(action, version), params
  JSON.parse(response.body) rescue {}
end

def api_post(action, params = {}, version = '1')
  post make_url(action, version), params
  JSON.parse(response.body) rescue {}
end

def api_delete(action, params = {}, version = '1')
  delete make_url(action, version), params
  JSON.parse(response.body) rescue {}
end

def api_put(action, params = {}, version = '1')
  put make_url(action, version), params
  JSON.parse(response.body) rescue {}
end

private

def make_url(action, version = '1')
  "/api/v#{version}/#{action}"
end
