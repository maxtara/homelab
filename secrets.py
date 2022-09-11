from pykeepass import PyKeePass
import getpass,os,io,j2cli
secrets = PyKeePass("file.kdbx", password=getpass.getpass()).find_entries_by_title("key")[0].notes
context = j2cli.context.read_context_data("yaml",io.StringIO(secrets),None)
renderer = j2cli.cli.Jinja2TemplateRenderer(os.getcwd(), False, j2_env_params=j2cli.extras.customize.CustomizationModule(None).j2_environment_params())
result = renderer.render("input.yaml", context)
with open("output.yaml", "w") as f:
    f.write(result.decode("utf-8"))
print("Simple!")