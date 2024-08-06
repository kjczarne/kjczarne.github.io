---
title: "How Much You Ate"
date: 2024-08-03T14:25:47-04:00
showToc: false
noComment: true
draft: true
tags:
  - paper
---

## Abstract

Monitoring dietary intake is a crucial aspect of promoting healthy living. In recent years, advances in computer vision technology have facilitated dietary intake monitoring through the use of images and depth cameras. However, the current state-of-the-art image-based food portion estimation algorithms assume that users take images of their meals one or two times, which can be inconvenient and fail to capture food items that are not visible from a top-down perspective, such as ingredients submerged in a stew. To address these limitations, we introduce an innovative solution that utilizes stationary user-facing cameras to track food items on utensils, not requiring any change of camera perspective after installation. The shallow depth of utensils provides a more favorable angle for capturing food items, and tracking them on the utensil's surface offers a significantly more accurate estimation of dietary intake without the need for post-meal image capture. The system is reliable for estimation of nutritional content of liquid-solid heterogeneous mixtures such as soups and stews. Through a series of experiments, we demonstrate the exceptional potential of our method as a non-invasive, user-friendly, and highly accurate dietary intake monitoring tool.

<!-- {{< centerimage "/utensil-estimation/pipeline.drawio.png" "how-much-you-ate-diagram">}} -->
<!-- {{< centerimage "/utensil-estimation/correct_segmented.jpg" "correct-segmented">}} -->
{{< figure align=center src="/utensil-estimation/pipeline.drawio.png" caption="Volumetric estimation pipeline for utensils" >}}


{{< figure align=center src="/utensil-estimation/correct_segmented.jpg" caption="An example of a correctly-segmented frame" >}}

## Read

[Paper Link](https://arxiv.org/abs/2405.08717)

## Cite

```bibtex
@misc{sharma2024atefoodportionestimation,
      title={How Much You Ate? Food Portion Estimation on Spoons}, 
      author={Aaryam Sharma and Chris Czarnecki and Yuhao Chen and Pengcheng Xi and Linlin Xu and Alexander Wong},
      year={2024},
      eprint={2405.08717},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2405.08717}, 
}
```
