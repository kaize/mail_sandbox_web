MailSandboxWeb.Store = DS.Store.create({
  revision: 4,
  adapter: DS.RESTAdapter.create({
    bulkCommit:false,
    namespace: 'api'
  })
});

