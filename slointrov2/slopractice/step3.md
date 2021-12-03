Let's explore the available metrics in Datadog that can be used in SLIs for the SLOs. 

1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a> to view the list of services.

   If you've completed other courses in the Datadog Learning Center, you may see an **env:** menu next to the **Search services** field above the list of services. Make sure `env: ruby-shop` is selected so that only services for the Storedog app are listed. 

2. Click the **store-frontend** service. 

   The **store-frontend** service is related to the home page and managing the cart. 
   
   Explore the page to see what data is collected/displayed.

3. Scroll to the list of **Endpoints**. 

   **Spree::HomeController#index** is the resource for viewing the home page. When a user tries to view the home page, a request is made to this resource. 

   **Spree::OrderController#edit** is the resource for managing items in the cart. When a user tries to manage items in the cart, a request is made to this resource. 

   Let's explore both.

## SLI for Latency of Viewing the Home Page

4. Click **Spree::HomeController#index** to view its details. 

5. Expand the **Latency** graph as shown below. Notice that there are mutiple latency metrics based on distribution percentile below the Latency graph. 

   Let's be specific and use the metric for the p99 latency of a home page request `trace.rack.request.duration.by.resource_service.99p` in the SLI for the SLO to track latency of viewing the home page. (The p99 latency means that 99% of requests have latencies lower than this value.)

   Close the graph.

   ![homecontroller-latency](slopractice/assets/homecontroller-latency.gif)

6. Above the graphs for the resource, click **store-frontend** to navigate back to the service page.

## SLI for Successfully Managing Items in the Cart

7. Scroll to the **Endpoints** list and select **Spree::OrdersController#edit** to view its details.

   The **Total Request** graph is related to adding items to the cart.

8. Expand the **Total Request** graph as shown below.

   The `trace.rack.request.hits` metric is listed below the Total Requests graph. This metric is the count of total requests to the endpoint and is the sum of the requests that are successful and the requests that are errors
   
   If there are request errors, you would also see the `trace.rack.request.errors` metric. If you don't see the metric, that's alright. You'll see how to manually enter the metric when you create the SLO.

   You will use these two metrics in the SLI for the SLO to track successfully managing items in the cart.

   Close the graph.

   ![ordercontroller-requests](slopractice/assets/ordercontroller-requests.gif)

Let's create the SLOs now that you know which metrics you can use for the SLIs. 