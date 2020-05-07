module "key_pair" {
  source = "../../modules/key-pair"

  enable_key_pair = true
  key_name        = "test"
  public_key      = file("/Users/vadym_kudenchuk/.ssh/id_rsa_test.pub")
}