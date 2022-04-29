function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {   //If no arguments mentioned in vm arguments it will pick up staging 
    env = 'staging';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin1',
    password: 'welcome',
        _url: 'http://localhost:9897'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
       config.username = 'author';
       config.password = 'authorpassword';
  } else if (env == 'e2e') {
    // customize
       config.username = 'user';
       config.password = 'userpassword';
  } else if (env == 'staging') {
    // Initialize config for staging
       config.username = 'staginguser';
       config.password = 'staginguserpassword';
       config._url = 'http://staging.localhost:9897';
  } else if (env == 'preprod') {
    // Initialize config for prerpod
       config.username = 'preproduser';
       config.password = 'preproduserpassword';
       config._url = 'http://preprod.localhost:9897';
  } else if (env == 'prod') {
    // Initialize the config for prod
       config.username = 'produser';
       config.password = 'produserpassword';
       config._url = 'http://prod.localhost:9897'
  } 
  return config;
}