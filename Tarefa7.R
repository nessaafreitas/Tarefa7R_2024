library(tidyverse)

# Carregar os dados
dados_hosp <- read.csv2("C:/Botucatu/UNESP/2024/2024_2/FCM/AulaR/Tarefa7R/morbilidade-e-mortalidade-hospitalar.csv")

# Verificar a estrutura dos dados
glimpse(dados_hosp)

# Transformar as colunas de taxas em numéricas (se necessário)
dados_hosp <- dados_hosp %>%
  mutate(across(starts_with("Taxa"), as.numeric))

# Criar um gráfico boxplot para comparar a distribuição da taxa de mortalidade por região
dados_hosp %>%
  ggplot(aes(x = Região, y = Taxa.Mortalidade, fill = Região)) +
  geom_boxplot(alpha = 0.7, outlier.color = "red", outlier.size = 2) +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Distribuição da Taxa de Mortalidade por Região",
       x = "Região", 
       y = "Taxa de Mortalidade (%)",
       fill = "Região") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Salvar o gráfico
ggsave("boxplot_mortalidade_regiao.png", width = 12, height = 8)
