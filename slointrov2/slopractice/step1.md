In the terminal on the right, the Storedog app is being brought online and is being instrumented for monitoring with Datadog. Live traffic to the app is also being simulated. This may take up to 2 minutes. Once the app is running, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

Let's make sure that the Storedog app is instrumented successfully and you are collecting data from the Storedog app in Datadog.

1. In a new browser window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are being ingested for the Storedog app.
   
   If you are working in a new Datadog organization, the link will be redirected to the **APM** > **Introduction** page. You may need to wait about 2 minutes as Datadog's Autodiscovery feature detects the traces that are coming in. In the main menu, when the option appears, click the **APM > Traces** to see the list of traces.

3. Under **Facets**, expand **Env** and **Services**. 

   Make sure that `ruby-shop` is the only **Env** selected so that you are only viewing traces for the Storedog app.
   
   Make sure the **Services** shown below are listed. Click each to confirm that you are collecting live traces from them.
   
   ![trace-services](slopractice/assets/trace-services.png)

With Datadog collecting live app data from Storedog, let's start exploring the data to select SLIs for SLOs.

(For more details on how the app has been instrumented for monitoring with Datadog, you can go through <a href="https://learn.datadoghq.com/mod/lti/view.php?id=363" target="_blank">Instrumenting an App for Datadog APM</a> in the <a href="https://learn.datadoghq.com/course/view.php?id=33" target="_blank">Introduction to Application Performance Monitoring</a> course.)