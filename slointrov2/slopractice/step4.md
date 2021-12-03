<a href="https://docs.datadoghq.com/monitors/service_level_objectives/monitor/" target="_blank">Monitor-based SLOs</a> take a time-based approach to tracking SLIs. The SLO target is the proportion of the time window all the monitors should be in the OK state. 

Because latency is time-based, you'll create a Monitor-based SLO to track latency for viewing the home page.

SLO:
*`"Over the past 7 days, 99% of the time the p99 latency of a home page request should be less than 5 seconds."`*

That is, over 99% of the past 7 days, 99% of home page requests have a latency lower than 5 seconds.

Note: The SLO targets and time windows in this activity are just arbitrary. In real-world situations, various teams (Product, Engineering, Executive, etc.) would collaborate to determine SLO details.

The SLI for this SLO will be a monitor that tracks the trace metric for p99 latency (`trace.rack.request.duration.by.resource_service.99p`) of the **Spree::HomeController#index** resource in the **store-frontend** service. 

## Creating the Monitor for the SLI

1. Navigate to <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors** > **New Monitor**</a> and select **APM**.

   The <a href="https://docs.datadoghq.com/monitors/monitor_types/apm/?tab=apmmetrics" target="_blank">APM Monitor</a> is designed specifically for trace metrics. After you create the monitor, you'll see that the underlying monitor for the APM Monitor is a <a href="https://docs.datadoghq.com/monitors/monitor_types/metric" target="_blank">Metric Monitor</a> for the trace metric.

2. Expand **Select monitor scope**.
   
   Select `APM Metrics`.
   
   If there is a menu for **Primary tags**, select `env:ruby-shop`. (If there is no menu, that is alright. You will see a menu if there is more than one option for the `env` tag.)

   For **Service**, select `store-frontend`.
   
   For **Resource**, select `spree::homecontroller_index`.

   ![monitor-new-scope](slopractice/assets/monitor-new-scope2.png)

3. Expand **Set alert conditions**.

   Select `Threshold Alert`. 
   
   Set the alert criteria to **Alert when the** `p99 latency` **is** `above` `5` **over the last** `1 minute`.

   ![monitor-new-conditions](slopractice/assets/monitor-new-conditions.png)

4. Expand **Say what’s happening**.

   Leave the name of the monitor as is.
   
   Replace the description with `Monitor for the SLO "99% of the time the p99 latency of a home page request should be less than 5 seconds."`{{copy}}.

   ![monitor-new-descriptionslo](slopractice/assets/monitor-new-descriptionslo.png)

5. Make sure the **Notify your team** field is blank and `Do not notify` is selected. No notifications are needed in this activity.

   ![monitor-new-notification](slopractice/assets/monitor-new-notification.png)

6. Click **Save**. You'll be redirected to the monitor details. Browse the page.

   Notice the metric query details: the `trace.rack.request` metric is scoped to the respective `env`, `service`, and `resource_name`. (More information about distribution trace metrics can be found in the <a href="https://docs.datadoghq.com/tracing/guide/ddsketch_trace_metrics/" target="_blank">DDSketch-based Metrics in APM</a> documentation.)
   
   Notice that **Tags** have been automaically added for the corresponding `env`, `service`, and `resource_name`. You can use these tags to search the monitors in the Manage Monitors list. These tags also link the monitor to corresponding APM Service and Resource pages.

Now that you've created the monitor. Let's create the Monitor-based SLO.

## Creating the Monitor-based SLO

1. Navigate to <a href="https://app.datadoghq.com/slo/new" target="_datadog">**Monitors** > **New SLO**</a>.

2. Under **Define the source**, select **Monitor-based**, then select the monitor you created above, `Service store-frontend on resource_name:spree::homecontroller_index has a high p99 latency on env:ruby-shop`.

3. Under **Set your targets**, click **New Target +**. Set **Target:** to `99%` and **Time Window:** to `7 Days`.

4. Under **Add names and tags**, enter the following:

   Update the **Name** to `Home Page P99 Latency`{{copy}}.
   
   Add the description `99% of time, the p99 latency of viewing the home page should be lower than 5 seconds`{{copy}}.
   
   Individually enter or select the **Tags** `env:ruby-shop`{{copy}}, `service:store-frontend`{{copy}}, and `resource_name:spree::homecontroller_index`{{copy}}.

   ![monitor-slo-create](slopractice/assets/monitor-slo-create.png)

5. Click **Save & Exit**. You will be redirected to the details, status, and history of the SLO.

   ![new SLO](slopractice/assets/monitor-slo-new.png)

Because the app was just instrumented with Datadog, more metrics need to be collected before the SLO status and history provide insightful information about the SLO. If the app ran for more than 30 days, the history bar would be solid.

Example of older Monitor-based SLO
![old SLO](slopractice/assets/monitor-slo-7-days.png)

You've created the Monitor-based SLO to track latency for vieing the home page. Let's now create the second SLO to track successfully managing items in a cart.