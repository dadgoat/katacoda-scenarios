You can explore the respective APM Resource pages to investigate the depleting error budgets for the SLOs. 

1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM > Services**</a>.

2. Select the `store-frontend` service from the list. 

   Notice that the APM monitor and the Error Budget monitor you created are linked to the service and are in the `ALERT` state.

3. Scroll to the **Endpoints** list and select **Spree::HomeController#index** to explore the data for the resource.

   Notice that the monitor you created for the Monitor-based SLO is linked to the resource and is in the `ALERT` state.

4. View the **Latency** graph. Notice the increase in latency when the app restarted. Select the `p99` legend option. This is metric you used to create the monitor for the Monitor-based SLO.

5. Scroll down to the **Traces** list. Browse the **Duration** column. 

   Select a trace with duration less than 3 seconds. Note the lengths of the spans for `flask.request GET_/ads` and `flask.request GET_/discounts`.

   Select a trace with duration greater than 3 seconds. Notice the lengths of the spans for `flask.request GET_/ads` and `flask.request GET_/discounts` is longer than those in the traces with duration less than 3 seconds.

   *Looks like ads and discounts services are the sources of the higher latencies!* 
   
   *Investigating/troubleshooting these services can be a first step in restoring the error budget for the Monitor-based SLO.*
  
6. Navigate to `store-frontend` Service page.

7. Select **Spree::OrdersController#edit** from the **Endpoints** list to explore the data for the resource.

   Notice that the Error Budget Monitor you created for the Metric-based SLO is linked to the resource and is in the `ALERT` state.

7. Scroll to the **Traces** list. 

   Filter the list for traces with an **ERROR**. 
   
   Click a trace to see its details, specifically the **Errors** tab for details about the errors.

   *Looks like there is error in a file for the store-frontend service!* 
   
   *Investigating/troubleshooting this error can be a first step in restoring the error budget for the Monitor-based SLO.*

With Datadog, your teams can start exploring related infrastructure and app data to find the sources of depleting error budgets to work toward restoring them and meeting your SLO targets.  