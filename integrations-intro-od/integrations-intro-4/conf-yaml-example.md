You've already learned about `conf.yaml.example`, but it's worth taking a look at the generated output to get a feel for how the `spec.yaml` file is used. Take a moment to look at `dd/integrations-extras/awesome/datadog_checks/awesome/data/conf.yaml.example`{{open}} and consider these questions:
<details>
  <summary>If you wanted to monitor _another_ URL, how would you do that?</summary>
  
  - You would add an additional entry under `instances` in the `conf.yaml` file.
  
</details>
<details>
  <summary>What, if anything, would un-commenting the `flag_follow_redirects` option do?</summary>
  
  - The comments show the default options for these settings. So uncommenting it wouldn't change anything. However, uncommenting it and then changing the boolean would change the behavior.

</details>

Thinking back to `spec.yaml`  - (you can find yours here `dd/integrations-extras/awesome/assets/configuration/spec.yaml`{{open}}):
<details>
  <summary>What does uncommenting that final `template:` line do? (You can try this) Note that you might need to close and reopen the `conf.yaml.example` file to see the changes after re-running `ddev validate config --sync awesome`{{execute}}</summary>
  
  - The `http` template provides additional options to make the connection such as authentication with username and passwords. This could be useful if an account was required for the desired domain.

</details>
If you want to learn more about the configuration specification itself, the [Datadog integrations documentation](https://docs.datadoghq.com/developers/integrations/check_references/#configuration-file) goes into the details. 

When you're ready, move to the next step to learn about the manifest.