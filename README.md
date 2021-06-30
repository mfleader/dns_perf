

Write service names and their namespaces as a list of DNS queries to queries.txt.

```shell
  oc get svc -A -o template --template '{{range .items}}{{.metadata.name}}.{{.metadata.namespace}}.svc.cluster.local A{{"\n"}}{{end}}' > queries.txt
```

copy a file out

```shell
  oc cp nginx-deploy-debug:dnsout.tar.gz /root/dnsout.tar.gz
```