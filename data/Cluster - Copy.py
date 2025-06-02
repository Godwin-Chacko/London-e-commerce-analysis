import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans

# Load dataset
data = pd.read_csv('Sales Transaction v.4a.csv')
product_names = data['ProductName'].astype(str)

# TF-IDF vectorization
vectorizer = TfidfVectorizer(stop_words='english', max_features=1000)
X = vectorizer.fit_transform(product_names)

# KMeans clustering
n_clusters = 5
kmeans = KMeans(n_clusters=n_clusters, random_state=42)
kmeans.fit(X)
data['CatNo'] = kmeans.labels_

# Get feature (word) names
terms = vectorizer.get_feature_names_out()
order_centroids = kmeans.cluster_centers_.argsort()[:, ::-1]

# Print top 9 keywords per cluster (so you can label them manually)
print("Top 9 keywords per cluster:\n")
for i in range(n_clusters):
    top_words = [terms[ind] for ind in order_centroids[i, :9]]
    print(f"Cluster {i}: {', '.join(top_words)}")

# After reviewing the above, use manually defined names:
cat_names = {
    0: "Retro & Vintage Kids' Items",
    1: "Kitchen, Pantry & Select Home Goods",
    2: "Christmas & Holiday Merchandise",
    3: "Retro & Vintage Bags",
    4: "Kids' Tableware, Party Decor & Modern Accessories"
}


# Map to final category names
data['CatName'] = data['CatNo'].map(cat_names)

# Save updated file
data.to_csv('Sales Transaction with Categories.csv', index=False)

# Preview
print("\nSample results:")
print(data[['ProductName', 'CatNo', 'CatName']].head())

