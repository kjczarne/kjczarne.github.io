---
title: "Uarr"
date: 2024-08-05T21:00:39-04:00
showToc: false
noComment: true
draft: true
tags:
  - project
---

{{< figure align=center src="/uarr/microarray_generation.gif" >}}

[~~Code~~]() **Coming Soon**

[Slides](/uarr/uarr-slides.html)

## Description

Microarray technology has for many years remained a golden standard in transcriptomics. However, preparation of physical slides in wet labs involves procedures which tend to introduce occasional dirt and noise into the slide. Having to repeat experiments due to environmental noise present in the scanned images leads to increased reagent and labor costs. In this work we explore denoising methods in the narrow subfield of microarray image analysis. We propose SADGE, a domain-relevant metric to quantify the denoising power of methods considered. We introduce a synthetic data generation protocol which permits the creation of very large microarray image datasets programmatically and provides noise-free ground truth useful for objective quantification of denoising. We also train several deep learning architectures for the denoising task, with several of them beating the current state-of-the-art method on both PSNR and SADGE metrics. We propose a new training modality leveraging EATME module to condition the image reconstruction on ground-truth expression values and we introduce an additional loss term (DEL) which further enhances the denoising capabilities of the model while ensuring minimal information loss.
