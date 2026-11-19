# Human placental stem cells orchestrate an amyeloid cell-driven immunosuppressive program that ameliorates proinflammatory CNS pathology in experimental autoimmune encephalomyelitis

 
Analysis code for the manuscript of the same title in *Nature Communications*.
 
## Abstract
 
Despite a growing interest in Amniotic Epithelial Cell (AEC)-based Vijay Jinhtherapies, the immune responses triggered by AEC transplantation in vivo remain poorly characterized, particularly within the central nervous system (CNS). Here, we show that intracisternal delivery of human AECs in mice with Experimental Autoimmune Encephalomyelitis (EAE) induces a CNS-specific immunoregulatory myeloid pathway induced comprising immunosuppressive Arginase 1+ (ARG1+) macrophages and a population of myeloid-derived suppressor cells with eosinophilic characteristics, which we term Eo-MDSCs. Importantly, Eo-MDSCs diminish pathogenic T cell responses while increasing anti-inflammatory T cell subsets. In mice with established EAE disease, AEC-induced immunological responses result in reduced numbers of pathogenic macrophages and T helper (TH)17 cells, increased numbers of anti-inflammatory T cell subsets, and enhanced myelin phagocytosis, culminating in functional recovery. These findings thus suggest that AEC therapy can target CNS-intrinsic inflammatory processes in preclinical models of multiple sclerosis, providing a strong rationale for translation into the clinic.

 
## Data availability
 
Raw and processed data are deposited in public repositories. This repository contains code only.
 
| Data | Accession | Samples | Analysed in |
|---|---|---|---|
| Bulk RNA-seq | [GSE301776](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE301776) | 16 samples: Ctrl, 6 h, 1 day and 3 days after AEC injection (n = 4 per time point) | `bulk_RNAseq/` |
| Single-cell RNA-seq | [GSE301590](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE301590) | brain high-granularity (HG) cells each from PBS- and AEC-treated mice| `scRNA_brain_CD45_HG/` |
| Single-cell RNA-seq | [GSE301590](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE301590) | Brain immune cells each from PBS- and AEC-treated mice | `scRNA_PBS_vs_AEC/` |
| Single-nucleus RNA-seq (10x On-Chip Multiplexing) | [GSE301590](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE301590) | Ctrl, day 1, day 4 and day 7 (n = 4 per time point, multiplexed into 4 libraries) | `snRNA_brain_border_timecourse/` |
| Proteomics (label-free LC-MS/MS) | [PXD077193](https://www.ebi.ac.uk/pride/archive/projects/PXD077193) | Sorted HG cells vs microglia from AEC-treated mouse brain (n = 5 per group, plus 3 pilot HG samples) | `proteomics/` |
 
All data are from mouse; reads were aligned to the GRCm39 reference genome.
 
## Repository structure
 
```
├── Bulk.qmd                     # Bulk RNA-seq: PCA, DESeq2, volcano plots, GO/GSEA, Venn diagrams
├── Proteomics.qmd               # Proteomics: normalisation, PCA, DEqMS, GO/GSEA
├── scRNA_brain_CD45_HG/                           # Brain CD45+ immune cells and HG cells
│   ├── 00_cellranger.sh                           # Cell Ranger commands
│   ├── 01_brain_CD45_QC_integration_annotation.qmd
│   ├── 02_merge_CD45_HG.Rmd                       # Merge with HG cells, Harmony, markers, proportions
│   ├── 03_selected_genes.Rmd
│   ├── 04_trajectory_Slingshot_tradeSeq_Monocle3.Rmd
│   ├── 05_CellChat.qmd
│   ├── 06_NicheNet.Rmd
│   ├── 07_SCENIC.qmd
│   ├── 08_HG_label_transfer_Azimuth.qmd
│   └── 09_phagocytosis_neutrophil_genes.Rmd
├── snRNA_brain_border_timecourse/                 # Brain border snRNA-seq, Ctrl, day 1 and day 4
│   ├── 01_QC_integration_annotation_DE.qmd        # QC, integration, annotation, proportions, time-point DE
│   └── 02_CellChat_NicheNet_with_HG.qmd
├── scRNA_PBS_vs_AEC/
│   ├── 01_QC_integration_annotation.Rmd
│   ├── 02_myeloid_cells.Rmd
│   ├── 03_mast_T_B_dendritic_neutrophil.Rmd
│   ├── 04_cell_communication_CellChat_LIANA.Rmd
│   ├── 05_SCENIC.Rmd
│   └── 06_myeloid_trajectory.Rmd
├── snRNA_PBS_vs_AEC/
│   ├── 01_QC_integration_annotation.Rmd
│   ├── 02_oligodendrocyte_lineage.Rmd
│   └── 03_neurons_astrocytes_fibroblasts.Rmd
├── LICENSE
└── README.md
```
 
## Requirements
 
Analyses were run in R (≥ 4.3) with Quarto. Main packages:
 
- **Single-cell:** Seurat (≥ 5.0), SeuratWrappers, DoubletFinder, clustree, niceRplots, CellChat (v2), mascarade, geomtextpath
- **Bulk RNA-seq:** DESeq2, EnhancedVolcano, ggVennDiagram, gplots
- **Proteomics:** [DEqMS](https://github.com/yafeng/deqms)
- **Enrichment:** clusterProfiler, gprofiler2, correlationAnalyzeR, DOSE, org.Mm.eg.db
- **General:** tidyverse, ComplexHeatmap, cowplot, patchwork, plotly, DT
Other tools:
 
- Cell Ranger 7.0.1 (`count`, single-cell libraries) and 9.0.1 (`multi`, On-Chip Multiplexing libraries)
- pySCENIC (Python) for gene regulatory network analysis
- Cellchat for cell-cell interaction analysis
## Usage
 
Each `.qmd` notebook can be run in RStudio/Positron or rendered with `quarto render <file>.qmd`. Download the input data from the accessions above and place it in the paths read at the top of each notebook.
 
## Citation
 
If you use this code, please cite:
 
> Guo Y\*, Bencina S\*, Virgilio GA\*, Zhu K, Joshua V, Cheng Y, Lin J, Min J-H, Benito-Cuesta I, Suerth V, Trigo Alonso P, Xu F, Massa A, Thomas OG, Rykaczewska U, Göritz C, Ortlieb Guerreiro Cacais A, Jagodic M, Pahlevan Kakhki M, Gramignoli R, Harris RA\*#, Sarlus H\*#. Human placental stem cells orchestrate an amyeloid cell-driven immunosuppressive program that ameliorates proinflammatory CNS pathology in experimental autoimmune encephalomyelitis *Nature Communications* .
>
> \*Equal contribution. #Corresponding authors.
 
## Contact
 
- Code and data analysis: Yuxi Guo — yuxi.guo@ki.se
- Corresponding authors: Robert A. Harris — robert.harris@ki.se; Heela Sarlus — heela.sarlus@ki.se

Department of Clinical Neuroscience, Karolinska Institutet, Center for Molecular Medicine, Karolinska University Hospital, Stockholm, Sweden
 
## License
 
The code in this repository is released under the [Apache License 2.0](LICENSE).
