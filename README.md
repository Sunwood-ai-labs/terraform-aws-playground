# Terraform AWS Playground

このリポジトリは、AWSリソースをTerraformで管理するための実験的な環境（サンドボックス）です。

## 概要

このプロジェクトは、Terraformを使用してAWSリソースをプロビジョニングし管理する方法を学習し、実験するためのものです。

## 前提条件

- [Terraform](https://www.terraform.io/downloads.html)がインストールされていること
- AWSアカウントと適切な権限を持つIAMユーザー
- AWS CLIがインストールされ、設定されていること

## 使用方法

1. このリポジトリをクローンします：

   ```
   git clone https://github.com/yourusername/terraform-aws-playground.git
   cd terraform-aws-playground
   ```

2. Terraformの初期化：

   ```
   terraform init
   ```

3. 実行計画の確認：

   ```
   terraform plan
   ```

4. リソースの作成：

   ```
   terraform apply
   ```

5. リソースの削除：

   ```
   terraform destroy
   ```

## 注意

このプロジェクトは学習と実験のためのものです。本番環境での使用は推奨されません。AWSリソースの使用には料金が発生する可能性があるため、使用後は必ずリソースを削除してください。

## カスタマイズ

`variables.tf`ファイルを編集することで、デフォルトのリージョンやインスタンスタイプなどを変更できます。新しいリソースを追加する場合は、`main.tf`ファイルを編集してください。

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。
