# Deploying an Octoprint dashboard

* Create a Drogue Cloud application
* Deploy Knative service https://github.com/ctron/octoprint-converter/
* Configure the Knative endpoint for "enrichment" in the Drogue Cloud application:

  ```yaml
  spec:
    publish:
      rules:
        - when: always
          then:
            - enrich:
                endpoint:
                  url: "https://octoprint-converter-ctron-octoprint.apps.my-cluster"
  ```
* Configure the credentials in [values.yaml](applications/dashboard/values.yaml)
* Deploy the chart
