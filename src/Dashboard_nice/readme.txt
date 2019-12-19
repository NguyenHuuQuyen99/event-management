change the BundleConfig

add "~/Content/dashboard.css"

--> bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/dashboard.css"));

bug: problem with the bit value cannot render the checkbox for it