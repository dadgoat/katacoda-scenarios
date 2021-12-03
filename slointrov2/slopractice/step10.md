You created an SLO related to the latency of viewing the home page and an SLO related to successfully managing items in the cart.

You can also create an SLO related to successfully viewing the home page and an SLO related to the latency of managing items in the cart.

1. Create a Metric-based SLO for successfully viewing the home page and an Error Budget Monitor for the SLO. You can set the target and time window as desired.

   Hint: Use the `trace.rack.request.hits` and `trace.rack.request.errors` metrics scoped to the `env:ruby-shop`, `service:store-frontend`, and `resource_name:spree::homecontroller_index` for the SLI.

2. Create a Monitor-based SLO for the p99 latency of managing items in the cart. You can set the target and time window as desired.

   Hint: Create a monitor similar to the one you created for the p99 latency of viewing the home page, but scoped to the resource `resource_name:spree::ordercontroller_edit` for the SLI.

3. Add the new SLOs and associated monitors to the dashboard you created.

   Are the new SLOs affected by the errors in the broken app? That is, do either have error budgets less than 0%?

4. Explore the respective APM Resource pages. 

   Are you able to find more information about the source of the consumed error budgets.

5. Explore the Storedog app and the APM Service and Resource pages for the app in Datadog. 

   What other SLOs can you create for the app?


