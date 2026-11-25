import 'package:material_ui/material_ui.dart'; 
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _projectName = "";
  String _description = "";
  String _category = "Web Development"; // default
  String _technologies = "";
  String _projectLink = "";
  String _projectImageUrl = "";

  final List<String> _categories = [
    'Web Development',
    'Mobile Development',
    'Machine Learning',
    'Data Science',
    'Other',
  ];

  bool _isSubmitting = false;

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);

    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

    Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Pastikan pengguna sudah login.
      final loggedIn = await ensureLoggedIn(context);

      if (!mounted || !loggedIn) return;

      // Ambil token autentikasi.
      final authState = context.read<AuthState>();
      final token = authState.token;

      if (token == null) {
        throw Exception('Token autentikasi tidak ditemukan.');
      }

      // Buat objek Project sesuai model.
      final project = Project(
        title: _projectName,
        description: _description,
        techStack: _technologies,
        projectUrl: _projectLink,
        projectImageUrl: _projectImageUrl,
      );

      // Kirim data ke Django REST Framework.
      await context.read<ApiClient>().createProject(
        project,
        token: token,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Project berhasil ditambahkan!'),
        ),
      );

      Navigator.pop(context);
    } on ApiException catch (e) {
      if (!mounted) return;

      if (e.statusCode == 401) {
        // Token tidak valid atau sudah kedaluwarsa.
        await context.read<AuthState>().logout();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Sesi login berakhir. Silakan login kembali.',
            ),
          ),
        );

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Gagal menambahkan project. '
            'Status code: ${e.statusCode}',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Project Form'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter project name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Project name cannot be empty.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _projectName = value!.trim();
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Describe your project',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description cannot be empty.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!.trim();
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Technologies',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'e.g. Flutter, Django, Python',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Technologies cannot be empty.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _technologies = value!.trim();
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Project Link',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'https://example.com',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Project link cannot be empty.';
                  }

                  if (!_isValidUrl(value.trim())) {
                    return 'Please enter a valid HTTP or HTTPS URL.';
                  }

                  return null;
                },
                onSaved: (value) {
                  _projectLink = value!.trim();
                },
              ),

              const SizedBox(height: 16),

              const Text(
                'Project Image URL (Optional)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'https://example.com/image.png',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  if (!_isValidUrl(value.trim())) {
                    return 'Please enter a valid HTTP or HTTPS URL.';
                  }

                  return null;
                },
                onSaved: (value) {
                  _projectImageUrl = value?.trim() ?? '';
                },
              ),

              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const CircularProgressIndicator()
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}