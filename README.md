# Supporting both Range Queries and Frequency Estimation with Local Differential Privacy

This is a sample code (in MATLAB) of our [paper](https://xiaolangu.github.io/files/CNS19_paper.pdf) [CNS' 19]

Local Differential Privacy (LDP) provides provable privacy protection for data collection without the assumption of the trusted data server. Existing mechanisms that satisfy LDP or its variants either only consider aggregate queries from a group of users (e.g., frequency estimation) or individual queries for a single user (e.g., range queries). However, in complex real-world analytics applications, it is desirable to support both types of queries at the same time.

In this paper, we tackle the challenge of privately answering range queries and providing frequency estimation at the same time with high utility. We develop a data perturbation mechanism, which is proved to satisfy local d-privacy (a generalized version of LDP with distance metric) and have optimal utility for the co-location query (a specific type of range query). Then, we utilize an inversion approach for frequency estimation using the perturbed data. We analyze the theoretical Mean Square Error (MSE) of this estimation method and show the relationship to another existing estimation method under LDP. The results on both synthetic and real-world location datasets validate the correctness of our theoretical analysis and show that the proposed mechanism has better utility for both range queries and frequency estimation than the state-of-the-art mechanisms.

## Implementation

The main functions are PG1a.m and PG1b.m, which correspond to the results in Fig. 1 of the paper.
