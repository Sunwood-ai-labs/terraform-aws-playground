<p align="center"><img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/HarmonAI_II.png" width="100%"></p>

# Terraform AWS Playground

## AWSリソース管理の実験的環境 🚀

<p align="center">
  <img src="https://img.shields.io/github/stars/Sunwood-ai-labs/terraform-aws-playground?style=social" alt="GitHub stars">
  <img src="https://img.shields.io/github/forks/Sunwood-ai-labs/terraform-aws-playground?style=social" alt="GitHub forks">
  <img src="https://img.shields.io/github/last-commit/Sunwood-ai-labs/terraform-aws-playground" alt="Last commit">
  <img src="https://img.shields.io/github/languages/top/Sunwood-ai-labs/terraform-aws-playground" alt="Top language">
  <img src="https://img.shields.io/github/license/Sunwood-ai-labs/terraform-aws-playground" alt="License">
</p>

## 📚 概要

このプロジェクトは、Terraformを使用してAWSリソースをプロビジョニングし管理する方法を学習し、実験するためのサンドボックス環境です。初心者からエキスパートまで、AWSインフラストラクチャをコードとして管理する手法を探求できます。さらに、StreamlitアプリケーションをEC2インスタンス上にデプロイする方法も含まれています。

## ✨ 特長

- 🛠️ Terraformを使用したAWSリソースの簡単なプロビジョニング
- 🧪 安全な実験環境で、リスクなくインフラ管理を学習
- 📦 モジュール化された構造で、再利用可能なインフラコンポーネントを作成
- 🔄 バージョン管理されたインフラで、変更の追跡と復元が容易
- 🚀 迅速なデプロイメントと削除で、コスト効率の良い学習が可能
- 🌐 EC2インスタンス上でのStreamlitアプリケーションの自動デプロイ

## 🚀 インストールと使用方法

1. **前提条件**:
   - [Terraform](https://www.terraform.io/downloads.html)のインストール
   - AWSアカウントと適切な権限を持つIAMユーザー
   - AWS CLIのインストールと設定

2. **リポジトリのクローン**:
   ```bash
   git clone https://github.com/Sunwood-ai-labs/terraform-aws-playground.git
   cd terraform-aws-playground
   ```

3. **Terraformの初期化**:
   ```bash
   terraform init
   ```

4. **実行計画の確認**:
   ```bash
   terraform plan
   ```

5. **リソースの作成**:
   ```bash
   terraform apply
   ```

6. **Streamlitアプリへのアクセス**:
   - `terraform apply`の出力に表示されるURLにアクセスしてください。
   - 例: `http://<EC2_PUBLIC_IP>:8501`

7. **リソースの削除**:
   ```bash
   terraform destroy
   ```

詳細なドキュメントは[こちら](https://github.com/Sunwood-ai-labs/terraform-aws-playground/wiki)をご覧ください。

## 📁 プロジェクト構造

```
terraform-aws-playground/
├── main.tf          # メインのTerraform設定ファイル
├── variables.tf     # 入力変数の定義
├── outputs.tf       # 出力値の定義
└── README.md        # プロジェクトの説明書
```

## ⚙️ 設定

- `variables.tf`ファイルで、デフォルトのリージョンやインスタンスタイプなどを設定できます。
- 新しいリソースを追加する場合は、`main.tf`ファイルを編集してください。

主要な設定オプション:
- `aws_region`: 使用するAWSリージョン
- `instance_type`: EC2インスタンスタイプ
- `project_name`: プロジェクト名（リソースの命名に使用）

## 📝 アップデート履歴

- **v1.1.0** (2023-09-08)
  - StreamlitアプリのEC2インスタンスへの自動デプロイ機能を追加
  - セキュリティグループの設定を更新し、Streamlitアプリのポート(8501)を開放

- **v1.0.0** (2023-05-01)
  - 初期リリース
  - 基本的なEC2インスタンス作成機能の追加

- **v0.1.0** (2023-04-15)
  - プロジェクトの初期設定

## 🤝 コントリビューション

プロジェクトへの貢献を歓迎します！以下の方法で貢献できます：

- バグの報告
- 新機能の提案
- プルリクエストの送信

詳細は[CONTRIBUTING.md](CONTRIBUTING.md)をご覧ください。

## 📄 ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。

## 🙏 謝辞

- Terraformコミュニティ
- AWSドキュメンテーションチーム
- Streamlitコミュニティ
- 本プロジェクトに貢献してくださったすべての方々

## 📞 お問い合わせ・サポート

- プロジェクトに関する質問や問題は、[GitHub Issues](https://github.com/Sunwood-ai-labs/terraform-aws-playground/issues)で報告してください。
- より詳細な情報や最新のアップデートについては、[プロジェクトWiki](https://github.com/Sunwood-ai-labs/terraform-aws-playground/wiki)をご覧ください。

---

⚠️ **注意**: このプロジェクトは学習と実験のためのものです。本番環境での使用は推奨されません。AWSリソースの使用には料金が発生する可能性があるため、使用後は必ずリソースを削除してください。また、セキュリティ上の理由から、公開されているStreamlitアプリに機密情報を含めないようにしてください。
