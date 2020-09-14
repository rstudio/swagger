## Comments

#### 2020-9-11

Bumping the internal Swagger UI and added another function.

Please let me know if there is anything else I can do.

Best,
Barret

#### 2020-9-1
From: Javier Luraschi <javier@rstudio.com>
Date: Tue, Sep 1, 2020 at 12:57 PM
Subject: Re: Change maintainer on {swagger}
To: Barret Schloerke <barret@rstudio.com>


Changed with this [PR](https://github.com/rstudio/swagger/pull/16), all we have to do now is rebuild the package with this change and submit to CRAN.

#### 2020-9-1
From: Barret Schloerke <barret@rstudio.com>
Date: Tue, Sep 1, 2020 at 12:43 PM
Subject: Change maintainer on {swagger}
To: Javier Luraschi <javier@rstudio.com>

Hi Javier,

Can we set the maintainer of `swagger` to be me, Barret Schloerke <barret@rstudio.com>?

Thank you,
Barret


## Test environments

* local R installation, R 4.0.0
  * 0 errors | 0 warnings | 0 notes
* GitHub Actions
  * Environments
    * macOS-latest, R release
    * windows-latest, R release
    * windows-latest, R oldrel
    * ubuntu 16.04
      * R devel
      * R release
      * R oldrel
      * R 3.5
      * R 3.4
      * R 3.3
  * Results
    * 0 errors | 0 warnings | 0 notes


* win-builder (devel)
  * checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Barret Schloerke <barret@rstudio.com>'

  Version jumps in minor (submitted: 3.33.0, existing: 3.9.2)

  New maintainer:
    Barret Schloerke <barret@rstudio.com>
  Old maintainer(s):
    Javier Luraschi <javier@rstudio.com>


## revdepcheck results

We checked 2 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
